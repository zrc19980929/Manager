package com.manager.manager.security;

import com.manager.manager.security.authentication.MyAuthenctiationFailureHandler;
import com.manager.manager.security.authentication.MyAuthenticationSuccessHandler;
import com.manager.manager.security.authentication.MyLogoutSuccessHandler;
import com.manager.manager.security.authentication.RestAuthenticationAccessDeniedHandler;
import org.springframework.context.annotation.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Configuration
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    //加载登录成功的处理器
    @Autowired
    private MyAuthenticationSuccessHandler myAuthenticationSuccessHandler;
    //加载登录失败的处理器
    @Autowired
    private MyAuthenctiationFailureHandler myAuthenctiationFailureHandler;
    //加载异常处理的处理器
    @Autowired
    private RestAuthenticationAccessDeniedHandler restAuthenticationAccessDeniedHandler;
    //加载用户注销的处理器
    @Autowired
    private MyLogoutSuccessHandler myLogoutSuccessHandler;

    /**
     *使用HttpSecurity进行配置
     * 1.首先使用了csrf().disable()
     * CSRF (Cross Site Request Forgery)攻击，中文名：跨站请求伪造。
     * 其原理是攻击者构造网站后台某个功能接口的请求地址，诱导用户去点击或者用特殊方法让该请求地址自动加载。
     * 用户在登录状态下这个请求被服务端接收后会被误以为是用户合法的操作。
     * 对于 GET 形式的接口地址可轻易被攻击。
     * 对于 POST 形式的接口地址也不是百分百安全，攻击者可诱导用户进入带 Form 表单可用POST方式提交参数的页面。
     * 解决方式是在请求地址中添加 token 并验证
     * //项目中启用了 security，post请求无法通过，页面报错：解决方案： 如果不采用csrf，加上 .csrf().disable()即可：
     *
     * 2.X-Frame-Options
     * 用来告诉浏览器，页面能不能以 frame、 iframe、 object 形式嵌套在其他站点中，用来避免点击劫持(clickjacking)攻击。
     *  DENY：页面不允许在 frame 中展示
     *  SAMEORIGIN：same origin，页面可以在相同域名页面的 frame 中展示
     *  ALLOW-FROM uri：页面可以在指定来源的 frame 中展示
     * 所以我们配置了 httpSecurity.headers().frameOptions().sameOrigin();页面可以在相同域名页面的 frame 中展示
     *
     * 3.authorizeRequests().antMatchers("/login.html","/statics/**","/assets/**","/js/**","/css/**")
     *                      .permitAll()
     *                      .anyRequest()
     *                      .authenticated()
     * 这是对Requests请求进行授权认证， antMatchers（"..."）是对这些文件不进行拦截 比如：静态资源文件
     * .anyRequest().authenticated()是对剩下的所有请求进行拦截也就是权限控制比如：mama没有设置菜单的权限就返回403界面
     *
     * 4.httpSecurity.formLogin()
     *                .loginPage("/login.html")
     *                .loginProcessingUrl("/login")
     *                .successHandler(myAuthenticationSuccessHandler)
     *                .failureHandler(myAuthenctiationFailureHandler)
     *  配置自定义的登录流程  前端发过来的地址loginProcessingUrl
     *  然后返回的页面为loginPage 但是这是返回的地址不是实际的页面需要在SecurityController里面配置页面从而让thymeleaf正确解析到页面在哪里
     *  之通过successHandler和failureHandler来拦截成功或者失败后的信息并进行前端处理 。（子线程与主线程通过Handler来进行通信。子线程可以通过Handler来通知主线程进行UI更新。）
     *
     * 5..logout().permitAll().invalidateHttpSession(true).
     *            deleteCookies("JSESSIONID").logoutSuccessHandler(myLogoutSuccessHandler);
     * 通过logout()配下的函数对注销进行配置  deleteCookies	消除Cookie   logoutSuccessHandler 配置注销后的处理器处理事务
     *
     * 6.异常处理 无权限时的异常处理的403页面的配置通过 httpSecurity.exceptionHandling().accessDeniedHandler(restAuthenticationAccessDeniedHandler);
     * */
    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.csrf().disable();
        httpSecurity.authorizeRequests()
                .antMatchers("/login.html",
                        "/my/**",
                        "/treetable-lay/**",
                        "/xadmin/**",
                        "/ztree/**",
                        "/statics/**","/assets/**","/js/**","/css/**"
                        )
                .permitAll()
                .anyRequest()
                .authenticated()
                ;
        //解决X-Frame-Options DENY问题
        httpSecurity.headers().frameOptions().sameOrigin();
        httpSecurity.formLogin()
                .loginPage("/login.html")
                .loginProcessingUrl("/login")
                .successHandler(myAuthenticationSuccessHandler)
                .failureHandler(myAuthenctiationFailureHandler)
        .and().logout().permitAll().invalidateHttpSession(true).
                deleteCookies("JSESSIONID").logoutSuccessHandler(myLogoutSuccessHandler);

        //异常处理
        httpSecurity.exceptionHandling().accessDeniedHandler(restAuthenticationAccessDeniedHandler);
    }
    /**
     * 使用springSecurity提供的BCryptPasswordEncoder()算法实现加密
     *  public static void main(String[] args) {
     *         String pass = "admin";
     *         BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();
     *         String hashPass = bcryptPasswordEncoder.encode(pass);
     *         System.out.println(hashPass);
     *
     *         boolean flag = bcryptPasswordEncoder.matches("admin",hashPass);
     *         System.out.println(flag);
     *     }
     *     可以看到，每次输出的hashPass 都不一样，但是最终的flag都为 true,即匹配成功。
     *
     * 查看代码，可以看到，其实每次的随机盐，都保存在hashPass中。
     * 在进行matchs进行比较时，调用BCrypt 的String hashpw(String password, String salt)方法。
     * 两个参数即”admin“和 hashPass
     * 加密为bcryptPasswordEncoder.encode(pass);
     * 随机盐匹配时bcryptPasswordEncoder.matches("admin",hashPass);
     * 这便是加密过程
     * */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /**
     * //使用springSecurity的UserDetailsService来完成自定义的认证
     *  @Autowired
     *  private UserDetailsService userDetailsService;
     * */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

}

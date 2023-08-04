//package aaa.aaa.aaa.config;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.http.MediaType;
//import org.springframework.http.converter.HttpMessageConverter;
//import org.springframework.web.servlet.config.annotation.EnableWebMvc;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
//
//import java.util.Collections;
//import java.util.List;
//
//@Configuration
//@EnableWebMvc
//public class WebMvcConfig extends WebMvcConfigurerAdapter {
//
//    @Override
//    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
//        MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
//        converter.setSupportedMediaTypes(Collections.singletonList(MediaType.APPLICATION_JSON));
//        converters.add(converter);
//    }
//}
package app.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

public class MailUtils {
    @Autowired
    protected JavaMailSender emailSender;
    @Autowired
    private ApplicationContext appContext;

    public void sendSimpleMessage(String to, String name) {
        String[] arg = new String[1];
        arg[0] = name;
        String subject = appContext.getMessage("mail.message.subject", arg,null);
        String content =   appContext.getMessage("mail.message.content", null,null);
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(content);
        emailSender.send(message);
    }
}

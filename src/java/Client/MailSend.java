/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Client;

import java.util.Properties;
import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Vatsal
 */
public class MailSend {
     public static ContactUsBean send(ContactUsBean bean) {
        String name = bean.getName();
        String email = bean.getEmail();
        String subject = bean.getSubject();
        String mess = bean.getMessage();
        String tmp = "Name : " + name + "\n" + "Email : " + email + "\n" + "Message : " + mess + "\n";

        final String username = "karanayan@gmail.com";
        final String password = "9016099369";
        Properties prop = new Properties();
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        try {
            String body = tmp;
            String htmlBody = tmp;
            String textBody = tmp;
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("09bce021@nirmauni.ac.in"));
            message.setSubject(subject);
            MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
            mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
            mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
            mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
            mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
            mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
            CommandMap.setDefaultCommandMap(mc);
            message.setText(htmlBody);
            message.setContent(textBody, "text/html");
            Transport.send(message);

            System.out.println("Done");

            bean.setValid(true);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return bean;
    }
}

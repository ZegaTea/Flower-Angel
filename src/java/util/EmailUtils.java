/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;
import java.net.URLDecoder;

/**
 *
 * @author dovan
 */
public class EmailUtils {

    public static boolean sendEmail(int idCart, double total, String msg, String emailTo) {
        String fullMsg = " - Bạn đã đặt hàng thành công với mã đơn hàng " + idCart
                + " \n\tTổng tiền phải trả là " + total + "$"
                + "\n------------------------------\n";
        fullMsg = fullMsg + " - Đơn hàng bao gồm: \n" + msg;
        try {
            Email email = new SimpleEmail();
            // Cấu hình thông tin Email Server
            email.setCharset("UTF-8");
            email.setHostName("smtp.googlemail.com");
            email.setSmtpPort(465);
            email.setAuthenticator(new DefaultAuthenticator(Constants.SYSTEM_EMAIL_AUTO_SEND,
                    Constants.SYSTEM_EMAIL_PASS));

            // Với gmail cái này là bắt buộc.
            email.setSSLOnConnect(true);

            // Người gửi
            email.setFrom(Constants.SYSTEM_EMAIL_AUTO_SEND, "AUTO SEND EMAIL SYSTEM");

            // Tiêu đề
            email.setSubject("Thông tin đơn hàng");

            // Nội dung email
            email.setMsg(fullMsg);

            // Người nhận
            email.addTo(emailTo);
            email.send();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}

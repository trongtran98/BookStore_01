package app.schedule;

import app.service.CartDetailService;
import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.text.SimpleDateFormat;
import java.util.Date;

@Configuration
@EnableScheduling
public class CartSchedule {
    private final Integer dateExpire = 5;
    @Autowired
    CartDetailService cartDetailService;

    private static final Logger logger = Logger.getLogger(CartSchedule.class);
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

    @Scheduled(cron = "0 0 0 * * ?")
    public void reportCurrentTime(){
        cartDetailService.deleteCartDetailInventory(dateExpire);
    }
}

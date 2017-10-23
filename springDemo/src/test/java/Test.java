import com.alibaba.fastjson.JSONObject;
import sun.util.calendar.BaseCalendar;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * Created by liuyan on 2017/7/24.
 */
public class Test {
    public static void main(String[] args) {
        Map<String, String> map = new HashMap<>();
        for (int i = 0; i < 500000; i++) {
            map.put("key" + i, "value" + i);
        }
        Date start = new Date();
        Set<String> keys = map.keySet();
        for (String key:keys) {
            String s = key + ":" + map.get(key);
        }
        Date end = new Date();
        System.out.println(end.getTime()-start.getTime());

        for (Map.Entry<String, String> entry:map.entrySet()) {
            String sa = entry.getKey() + "" + entry.getValue();
        }
        System.out.println(new Date().getTime()-end.getTime());

    }


}

package com.ruoyi.system.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class test1 {
    public static void main(String[] args) {
//        String a = HelperUtil.getConfigValue("ugo.ip");
////        System.out.print(a);
       /* List<Entity> list = new ArrayList<>();
        for (int i=0;i<10;i++){
            Entity e = new Entity();
            e.setOut1(i+1);
            e.setOut2(i+1);
            e.setOne1(i+1);
            e.setOne2(i+1);
            list.add(e);
        }*/
        Map<String, String> map = new HashMap<String, String>();
        map.put("we","123");
        map.put("we1","1234");
        map.put("we2", "234");
        map.put("qw1", "1");
        map.put("er2", "2");
        Set s = map.keySet();
        Iterator<String> iter = s.iterator();
        int count = 0;
        while(iter.hasNext()){
            String key = iter.next();
            if(key.indexOf("we") != -1){
                count += 1;
                System.out.println(key);
            }
        }
        System.out.println(count);
    }

}

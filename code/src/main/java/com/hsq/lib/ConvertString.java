package com.hsq.lib;


public final class ConvertString
{
	/**
	 * 去掉字符串中所有的空格
	 * @param srcStr
	 * @return optStr
	 */
    public static String omitBlank(String srcStr)
    {
        StringBuilder optStr = new StringBuilder();

        int i = 0;
        for(int j = srcStr.length(); i < j;)
        {
        	while(i < j && srcStr.charAt(i) != ' ')
            {
            	optStr = optStr.append(srcStr.charAt(i));
                i++;
            }
            if(i < j)
            {
                i++;
            }
        }

        return optStr.toString();
    }

    /**
     * 将第一个字母变成大写
     * @param srcStr
     * @param flag
     * @return
     */
    public static String changeFirstChar(String srcStr, String flag)
    {
        String optStr = "";
        if(flag.equals("U"))
        {
            optStr = srcStr.substring(0, 1).toUpperCase() + srcStr.substring(1, srcStr.length());
        }else {
            optStr = srcStr.substring(0, 1).toLowerCase() + srcStr.substring(1, srcStr.length());
        }
        return optStr;
    }

}
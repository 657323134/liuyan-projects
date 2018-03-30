package com.liuyan.a0329;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 16:21 2018/3/29
 */
public class HalfSearch {
    public static int halfSearch(int[] a, int goal) {
        int high = a.length -1;
        int low = 0;
        while(low <=high) {
            int middle = (low + high)/2;
            if (goal == a[middle]) {
                return middle;
            } else if (a[middle]>goal) {
                high = middle-1;
            } else {
                low=middle+1;
            }

        }
        return -1;
    }

    public static void main(String[] args) {
        int[] a = {1,3,7,8,9};
        int goal = 9;
        System.out.println(HalfSearch.halfSearch(a, goal));
    }
}

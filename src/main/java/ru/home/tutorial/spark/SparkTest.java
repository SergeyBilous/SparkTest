package ru.home.tutorial.spark;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;

import java.util.Scanner;

public class SparkTest {
    public static void main(String[] args) {
        SparkConf sparkConf = new SparkConf().setAppName("Spark-test").
                setMaster("spark://rhel.home.ru:7077");
        message("sparkConf created");
        JavaSparkContext ctx = new JavaSparkContext(sparkConf);
        message("Java  context created");
        ctx.stop();
        message("Context stopped");
    }

    public static void message(String txt) {
        System.out.println(txt);
        Scanner kbScanner = new Scanner(System.in);
        String resp = kbScanner.nextLine();
    }
}

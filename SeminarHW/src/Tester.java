import java.beans.BeanInfo;
import java.io.Externalizable;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.io.*;
import java.util.*;
import java.beans.Introspector;
import java.lang.reflect.*;

import java.beans.PropertyDescriptor;

/**
 * Created with IntelliJ IDEA.
 * User: Lev
 * Date: 23.11.13
 * Time: 17:58
 * To change this template use File | Settings | File Templates.
 */
/*public class Tester {
    public static void main(String[] args) {
        /*Random gen = new Random();
        int N = 100;
        int max;
        Scanner sc = new Scanner(System.in);
        while (true) {
            try {
                N = sc.nextInt();
            }
            catch (Throwable e) {
                System.out.print("Ошибка");
                continue;
            }
            break;
        }
        ArrayList<Integer> a = new ArrayList<Integer>();
        LinkedList<Integer> l = new LinkedList<Integer>();
        HashSet<Integer> h = new HashSet<Integer>();
        int[] m = new int[N];
        for (int i = 0; i < N; ++ i) {
            m[i] = gen.nextInt(10000);
            a.add(gen.nextInt(10000));
            l.add(gen.nextInt(10000));
            h.add(gen.nextInt(10000));
        }
        long t1, t2, t3, t4;
        //
        t1 = System.nanoTime();
        max = m[0];
        for (int i : a) {
            if (i > max) {
                max = i;
            }
        }
        t1 = System.nanoTime() - t1;
        //
        t2 = System.nanoTime();
        max = a.get(0);
        for (int i : a) {
            if (i > max) {
                max = i;
            }
        }
        t2 = System.nanoTime() - t2;
        //
        t3 = System.nanoTime();
        max = l.get(0);
        for (int i : l) {
            if (i > max) {
                max = i;
            }
        }
        t3 = System.nanoTime() - t3;
        //
        t4 = System.nanoTime();
        max = l.get(0);
        for (int i : l) {
            if (i > max) {
                max = i;
            }
        }
        t4 = System.nanoTime() - t4;
        //
        System.out.println(t1);
        System.out.println(t2);
        System.out.println(t3);
        System.out.println(t4);
        // Задача 2
        int n1 = 10;
        int n2 = 20;
        int[] arr1 = new int[n1];
        int[] arr2 = new int[n2];
        for (int i = 0; i < n1; ++ i) {
            arr1[i] = gen.nextInt(10000);
        }
        for (int i = 0; i < n2; ++ i) {

            arr2[i] = gen.nextInt(10000);
        }
        int arrr[] = new int[n1 + n2];
        for (int i = 0; i < N; ++ i) {
            arrr[i] = arr1[i];
        }
        for (int i = N; i < n1 + n2; ++ i) {
            arrr[i] = arr2[i];
        }
        Arrays.sort(arrr);
        //
        int i1 = 0;
        int i2 = 0;
        int[] arrrrrrrr = ;
        for (int i = 0; i < n1 + n2; ++ i) {
            if (i1 == n1) {
                for (int j = i; j < n1 + n2; ++ j) {
                    arrrrrrrr[j] = arr2[n2 - (n2 + n1 - j) - 1];
                }
            }
            if (i1 == n1) {

            }
        }
        //
        HashMap<A, String>  hm = new HashMap<A, String>();
        for (int i = 0; i < 150; ++ i) {
            hm.put(new A(String.valueOf(i)), String.valueOf(i));
        }
        long t = System.nanoTime();
        hm.get("99");
        System.out.println(t = System.nanoTime() - t);
        MyIntrospector i = new MyIntrospector();
        PropertyDescriptor descriptor = Introspector.getBeanInfo(MyIntrospector.class).getBeanDescriptor()[0];
    }
}   */
                 /*
class MyIntrospector {
    Introspector a;
    private int p;
    int getP() {
        return p;
    }
    public Method[] getProps(Class<?> myclass) {
        Method[] meths = myclass.getMethods();
        ArrayList<Method> m = new ArrayList<Method>();
        for (Method mmm : meths) {
            Class<?>[] params = mmm.getParameterTypes();
            if (Modifier.isPublic(mmm.getModifiers()) &&
                    !Modifier.isStatic(mmm.getModifiers()) && (
                    mmm.getName().startsWith("get") && params.length == 0 ||
                            (mmm.getName().startsWith("set") ||
                            (mmm.getName().startsWith("is")) && (mmm.getReturnType() == boolean.class))) &&
                    params.length == 1 && mmm.getReturnType() == void.class) {
                m.add(mmm);
            }
        }
        for (int i = 0; i < m.size(); ++ i) {
            for (int j = i + 1; j < m.size(); ++ j) {
                String n1 = m.get(i).getName();
                String n2 = m.get(j).getName();
                if ((n1.startsWith("is") || n1.startsWith("get")) && n2.startsWith("set") &&
                        m.get(j).getParameterTypes()[0].getClass() == m.get(i).getReturnType()) {
                    if (n1.startsWith("is")) {
                        n1 = n1.substring(2);
                    }
                    if (n1.startsWith("get")) {
                        n1 = n1.substring(3);
                    }
                    n2 = n2.substring(3);
                    if (n1.equals(n2)) {
                        //вот тут равно
                    }
                }
                if ((n2.startsWith("is") || n2.startsWith("get")) && n1.startsWith("set") &&
                        m.get(i).getParameterTypes()[0].getClass() == m.get(j).getReturnType()) {
                    if (n2.startsWith("is")) {
                        n2 = n2.substring(2);
                    }
                    if (n2.startsWith("get")) {
                        n2 = n2.substring(3);
                    }
                    n1 = n1.substring(3);
                    if (n1.equals(n1)) {
                        //вот тут равно
                    }
                }
            }
        }
    }
}
               */
    /*
class Storage {
    private int i;
    boolean lockG;
    boolean lockS;
    public Storage(int iii, boolean g, boolean s) {
        i = iii;
        lockG = g;
        lockS = s;
    }
    synchronized int getValue() {
            return i;
        }
    synchronized void setValue(int iii) {
        i = iii;
    }
                 }
class Counter implements Runnable {
    Storage st;
    Counter(Storage p) {
        st = p;
        new Thread(this).start();
    }
    public void run() {
        int i = 0;
        while (true) {
            st.setValue(i);
            ++ i;
        }
    }
}
public class Tester {
    public static void main(String[] args) {
        Storage s = new Storage(0);
        Counter c = new Counter(s);
        Printer p = new Printer(s);
    }
}
                             */
class Tester {
    public static void main(String[]args) {
        /*try {
            main(args);
        }
        catch (StackOverflowError e) {
            //e.printStackTrace();
            main(args);
        }*/
    }
}

class Obj1 implements Serializable {
    int i;
    String s;
    public Obj1(int iii, String sss) {
        i = iii;
        s = sss;
    }
    public String getS() {
        return s;
    }
    public int getI() {
        return i;
    }
}

/*class Obj2 implements Externalizable {
    int i;
    String s;
    public Obj2(int iii, String sss) {
        i = iii;
        s = sss;
    }
    public String getS() {
        return s;
    }
    public int getI() {
        return i;
    }
    public void set(Obj2 o){

    }
    public void writeExernal( ObjectOutput out) throws IOException {
        out.writeObject(this);
    }
    public void readExernal( ObjectOutput out) throws IOException {
        out.writeObject(this);
    }
}         */


abstract class aaa<T> {
    abstract void lol() throws InterruptedException;
}

class aaaa extends aaa {
    void lol() throws InterruptedException{
        boolean flag = true;
        Object o = new Object();
        synchronized(o) {
            while(flag) {
                o.wait();
            }
            o.notify();

        }
    }
    List<? extends Comparable> a = new ArrayList<Integer>();
}

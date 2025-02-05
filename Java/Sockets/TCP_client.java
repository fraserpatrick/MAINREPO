//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class TCP_client {
    public TCP_client() {
    }

    public static void main(String[] var0) {
        String var1 = var0[0];
        int var2 = Integer.parseInt(var0[1]);

        try {
            Socket var3 = new Socket(var1, var2);
            PrintWriter var4 = new PrintWriter(var3.getOutputStream(), true);
            BufferedReader var5 = new BufferedReader(new InputStreamReader(System.in));
            BufferedReader var6 = new BufferedReader(new InputStreamReader(System.in));

            String var7;
            while((var7 = var6.readLine()) != null) {
                var4.println(var7);
                System.out.println("echo: " + var5.readLine());
            }
        } catch (UnknownHostException var8) {
            System.err.println("Unknown host: " + var1);
            System.exit(1);
        } catch (IOException var9) {
            System.err.println("I/O exception: " + var9.getMessage());
            System.exit(1);
        }

    }
}

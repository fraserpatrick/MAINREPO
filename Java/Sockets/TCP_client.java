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
        String hostName = var0[0];
        int port = Integer.parseInt(var0[1]);

        try {
            Socket socket = new Socket(hostName, port);
            PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in));

            String input;
            while((input = stdIn.readLine()) != null) {
                out.println(input);
                System.out.println("echo: " + in.readLine());
            }
        } catch (UnknownHostException uhe) {
            System.err.println("Unknown host: " + hostName);
            System.exit(1);
        } catch (IOException ioe) {
            System.err.println("I/O exception: " + ioe.getMessage());
            System.exit(1);
        }

    }
}

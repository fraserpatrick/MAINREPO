import java.io.*;
import java.net.*;

public class TCP_server {
    public static void main(String[] args) {
        try (ServerSocket serverSocket = new ServerSocket(Integer.parseInt(args[0]))) {
            Socket socket1 = serverSocket.accept();
            System.out.println("Client 1 connected.");
            Socket socket2 = serverSocket.accept();
            System.out.println("Client 2 connected.");

            BufferedReader input1 = new BufferedReader(new InputStreamReader(socket1.getInputStream(), "UTF-8"));
            PrintWriter output1 = new PrintWriter(new OutputStreamWriter(socket1.getOutputStream(), "UTF-8"), true);

            BufferedReader input2 = new BufferedReader(new InputStreamReader(socket2.getInputStream(), "UTF-8"));
            PrintWriter output2 = new PrintWriter(new OutputStreamWriter(socket2.getOutputStream(), "UTF-8"), true);

            Thread client1Listener = new Thread(() -> {
                try {
                    String message;
                    while ((message = input1.readLine()) != null) {
                        System.out.println("Client 1: " + message);
                        output2.println("Client 1: " + message);
                    }
                } catch (IOException e) {
                    System.out.println("Client 1 disconnected.");
                }
            });
            client1Listener.start();

            Thread client2Listener = new Thread(() -> {
                try {
                    String message;
                    while ((message = input2.readLine()) != null) {
                        System.out.println("Client 2: " + message);
                        output1.println("Client 2: " + message);
                    }
                } catch (IOException e) {
                    System.out.println("Client 2 disconnected.");
                }
            });
            client2Listener.start();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

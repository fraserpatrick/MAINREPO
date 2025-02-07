import java.io.*;
import java.net.*;

public class TCP_client {
    public TCP_client() {
    }

    public static void main(String[] args) {
        String hostName = args[0];
        int port = Integer.parseInt(args[1]);

        try {
            Socket socket = new Socket(hostName, port);
            PrintWriter out = new PrintWriter(new OutputStreamWriter(socket.getOutputStream()), true);
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            BufferedReader input = new BufferedReader(new InputStreamReader(System.in));


            Thread receiveThread = new Thread(() -> {
                try {
                    String receivedMessage;
                    while ((receivedMessage = in.readLine()) != null) {
                        System.out.println(receivedMessage);
                    }
                } catch (IOException e) {
                    System.out.println("Connection closed.");
                }
            });
            receiveThread.start();

            String sendMessage;
            while ((sendMessage = input.readLine()) != null) {
                out.println(sendMessage);
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

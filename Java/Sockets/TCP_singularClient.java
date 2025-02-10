import java.io.*;
import java.net.*;
import java.util.Scanner;

public class TCP_singularClient {
    public static void main(String[] args) {
        attemptConnection();
    }

    public static void attemptConnection() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter port: ");
        int port = Integer.parseInt(scanner.nextLine());
        System.out.print("Enter 'host' to start a server or 'connect' to join: ");
        String choice = scanner.nextLine();

        try {
            Socket socket;
            if ("host".equalsIgnoreCase(choice)) {
                ServerSocket serverSocket = new ServerSocket(port);
                System.out.println("Waiting for connection...");
                socket = serverSocket.accept();
                System.out.println("Connected");
            } else {
                socket = new Socket("localhost", port);
                System.out.println("Connected");
            }

            handleCommunication(socket);
        } catch(ConnectException ce){
            System.out.println("Connection failed");
            attemptConnection();
        } catch (BindException be) {
            System.out.println("Port already hosted");
            attemptConnection();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private static void handleCommunication(Socket socket) {
        try {
            BufferedReader input = new BufferedReader(new InputStreamReader(socket.getInputStream(), "UTF-8"));
            PrintWriter output = new PrintWriter(new OutputStreamWriter(socket.getOutputStream(), "UTF-8"), true);
            Scanner scanner = new Scanner(System.in);

            Thread receiveThread = new Thread(() -> {
                try {
                    String receivedMessage;
                    while ((receivedMessage = input.readLine()) != null) {
                        System.out.println("Received: " + receivedMessage);
                    }
                } catch (IOException e) {
                    System.out.println("Connection closed.");
                }
            });
            receiveThread.start();

            String sendMessage;
            while ((sendMessage = scanner.nextLine()) != null) {
                output.println(sendMessage);
            }

            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

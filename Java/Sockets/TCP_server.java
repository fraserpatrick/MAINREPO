import java.io.*;
import java.net.*;

public class TCP_server {
    public static void main(String[] args) {
        int port = Integer.parseInt(args[0]);

        try{
            ServerSocket serverSocket = new ServerSocket(port);
            Socket clientSocket = serverSocket.accept();

            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));

            String inputLine;
            while((inputLine = in.readLine()) != null ){
                System.out.println("Received" + inputLine);
                out.println(inputLine);
            }
        }

        catch(IOException ioe){
            System.err.println(ioe);
            System.exit(1);
        }
    }
}

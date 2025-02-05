import java.net.*;
import java.io.*;

public class UDP_client {
    public static void main(String[] args) {
        try{
            DatagramSocket socket = new DatagramSocket();

            BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
            String input = in.readLine();

            byte[] buf = input.getBytes();
            InetAddress address = InetAddress.getByName(args[0]);
            DatagramPacket packet = new DatagramPacket(buf, buf.length, address, Integer.parseInt(args[1]));
            socket.send(packet);

            packet = new DatagramPacket(buf, buf.length);
            socket.receive(packet);

            String received = new String(packet.getData(), 0, packet.getLength());
            System.out.println("received: " +received);

            socket.close();
        }
        catch(Exception e){
            System.out.println(e);
        }

    }
}

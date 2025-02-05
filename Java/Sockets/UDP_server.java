import java.net.*;

public class UDP_server {
    public static void main(String[] args) {
        try{
            DatagramSocket socket = new DatagramSocket(Integer.parseInt(args[0]));

            byte[] buf = new byte[256];

            DatagramPacket packet = new DatagramPacket(buf, buf.length);
            socket.receive(packet);

            String received = new String(packet.getData(), 0, packet.getLength());
            System.out.println("received: " + received);

            InetAddress address = packet.getAddress();
            int port = packet.getPort();
            packet = new DatagramPacket(buf, buf.length, address, port);
            socket.send(packet);

            socket.close();
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
}

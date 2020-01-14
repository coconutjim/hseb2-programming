package seminar21.lecture_samples.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;

/**
 * User: EGrinkrug
 * Date: 2/22/13
 * Time: 3:54 PM
 */
public class NetworkClientTest extends AbstractNetworkClient {

    public NetworkClientTest(String host, int port) {
        super(host, port);
    }

    @Override
    protected void handleConnection(Socket client) throws IOException {
        PrintWriter out = getWriter(client);
        BufferedReader in = getReader(client);
        out.println("Generic Network Client");

        System.out.printf("Generic Network Client:%n" +
                        "Connected to '%s' and got '%s' in response.%n", getHost(), in.readLine());
    }

    public static void main(String[] args) {
        String host = "localhost";
        int port = 5000;//8088;
        if (args.length > 0) {
            host = args[0];
        }
        if (args.length > 1) {
             port = Integer.parseInt(args[1]);
        }
        NetworkClientTest tester = new NetworkClientTest(host, port);
        tester.connect();
    }
}

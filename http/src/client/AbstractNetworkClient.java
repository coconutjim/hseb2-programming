package seminar21.lecture_samples.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

/**
 * User: EGrinkrug
 * Date: 2/22/13
 * Time: 3:51 PM
 */
public abstract class AbstractNetworkClient {

    public static BufferedReader getReader(Socket s) throws IOException {
        return(new BufferedReader (new InputStreamReader(s.getInputStream())));
    }

    public static PrintWriter getWriter(Socket s) throws IOException {
        // Second argument of true means autoflush.
        return (new PrintWriter(s.getOutputStream(), true));
    }


    private String host;
    private int port;

    public String getHost() {
        return(host);
    }

    public int getPort() {
        return(port);
    }
    /** Register host and port. The connection won't
     * actually be established until you call
     * connect.
     */
    public AbstractNetworkClient (String host, int port) {
        this.host = host;
        this.port = port;
    }

    public void connect() {
        try {
            Socket client = new Socket(host, port);
            handleConnection(client);
            client.close();
        } catch(UnknownHostException uhe) {
            System.out.println("Unknown host: " + host);
            uhe.printStackTrace();
        } catch(IOException ioe) {
            System.out.println("IOException: " + ioe);
            ioe.printStackTrace();
        }
    }
    /** This is the method you will override when
     * making a network client for your task.
     */
    protected abstract void handleConnection(Socket client) throws IOException;

}

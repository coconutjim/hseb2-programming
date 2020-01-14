package seminar21.lecture_samples.nio;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.channels.*;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.util.Iterator;
import java.util.Set;

/**
 * https://www.ibm.com/developerworks/java/library/j-javaio/
 *
 * A server's ability to handle numerous client requests within a reasonable time
 * is dependent on how effectively it uses I/O streams.
 * A server that caters to hundreds of clients simultaneously must be able to use I/O services concurrently.
 * Until JDK 1.4 (aka Merlin), the Java platform did not support nonblocking I/O calls.
 * With an almost one-to-one ratio of threads to clients, servers written in the Java language were susceptible
 * to enormous thread overhead, which resulted in both performance problems and lack of scalability.
 *
 * To address this issue, a new set of classes have been introduced to the Java platform with the latest release.
 * Merlin's java.nio package is chock full of tricks for resolving thread overhead,
 * the most important being the new SelectableChannel and Selector classes.
 * A channel represents a means of communication between a client and a server.
 * A selector is analogous to a Windows message loop, in which the selector captures the various events
 * from different clients and dispatches them to their respective event handlers.
 * In this article, we'll show you how these two classes function together to create a nonblocking I/O mechanism
 * for the Java platform.
 *
 * The principal force behind the design of NIO is the Reactor design pattern.
 * Server applications in a distributed system must handle multiple clients that send them service requests.
 * Before invoking a specific service, however, the server application must demultiplex and dispatch
 * each incoming request to its corresponding service provider.
 * The Reactor pattern serves precisely this function. It allows event-driven applications to demultiplex
 * and dispatch service requests, which are then delivered concurrently to an application from one or more clients.
 *
 * The Reactor pattern is closely related to the Observer pattern in this aspect: all dependents
 * are informed when a single subject changes.
 * The Observer pattern is associated with a single source of events, however, whereas the Reactor pattern
 * is associated with multiple sources of events.
 *
 * NIO's nonblocking I/O mechanism is built around selectors and channels.
 * A Channel class represents a communication mechanism between a server and a client.
 * In keeping with the Reactor pattern, a Selector class is a multiplexor of Channels.
 * It demultiplexes incoming client requests and dispatches them to their respective request handlers.
 * We'll look closely at the respective functions of the Channel class and the Selector class,
 * and at how the two work together to create a nonblocking I/O implementation.
 *
 */


public class NonBlockingServer {

    public Selector sel = null;
    public ServerSocketChannel server = null;
    public SocketChannel socket = null;
    public int port = 4900;
    String result = null;


    public NonBlockingServer() {
        System.out.println("Inside default constructor...");
    }

//	public NonBlockingServer(int port)
//    {
//		System.out.println("Inside the other ctor");
//		this.port = port;
//    }

    public void initializeOperations() throws IOException
    //, UnknownHostException
    {
        System.out.println("Inside initialization");
        sel = Selector.open();
        server = ServerSocketChannel.open();
        server.configureBlocking(false);
        InetAddress ia = InetAddress.getLocalHost();
        InetSocketAddress isa = new InetSocketAddress(ia, port);
        server.socket().bind(isa);
    }

    public void startServer() throws IOException {
        System.out.println("Inside startServer");
        initializeOperations();
        System.out.println("About to block on select()");
        SelectionKey acceptKey = server.register(sel, SelectionKey.OP_ACCEPT );

        while (acceptKey.selector().select() > 0 ) {

            Set readyKeys = sel.selectedKeys();
            Iterator it = readyKeys.iterator();

            while (it.hasNext()) {
                SelectionKey key = (SelectionKey)it.next();
                it.remove();

                if (key.isAcceptable()) {
                    System.out.println("Key is Acceptable");
                    ServerSocketChannel ssc = (ServerSocketChannel) key.channel();
//					socket = (SocketChannel) ssc.accept();
                    socket = ssc.accept();
                    socket.configureBlocking(false);
//					SelectionKey another = socket.register(sel,SelectionKey.OP_READ|SelectionKey.OP_WRITE);
                    socket.register(sel,SelectionKey.OP_READ|SelectionKey.OP_WRITE);
                }
                if (key.isReadable()) {
                    System.out.println("Key is readable");
                    String ret = readMessage(key);
                    if (ret.length() > 0) {
                        writeMessage(socket,ret);
                    }
                }
                if (key.isWritable()) {
                    System.out.println("The key is writable");
                    String ret = readMessage(key);
                    socket = (SocketChannel)key.channel();
                    if (result.length() > 0 ) {
                        writeMessage(socket,ret);
                    }
                }
            }
        }
    }

    public void writeMessage(SocketChannel socket,String ret)
    {
        System.out.println("Inside the loop");

        if (ret.equals("quit") || ret.equals("shutdown")) {
            return;
        }
        File file = new File(ret);

        try {

            RandomAccessFile rdm = new RandomAccessFile(file,"r");
            FileChannel fc = rdm.getChannel();
            ByteBuffer buffer = ByteBuffer.allocate(1024);
            fc.read(buffer);
            buffer.flip();

            Charset set = Charset.forName("us-ascii");
            CharsetDecoder dec = set.newDecoder();
            CharBuffer charBuf = dec.decode(buffer);
            System.out.println(charBuf.toString());
            buffer = ByteBuffer.wrap((charBuf.toString()).getBytes());
            int nBytes = socket.write(buffer);
            System.out.println("nBytes = "+nBytes);
            result = null;
        } catch(Exception e) {
            e.printStackTrace();
        }

    }

    public String readMessage(SelectionKey key) {
//		int nBytes = 0;
        socket = (SocketChannel)key.channel();
        ByteBuffer buf = ByteBuffer.allocate(1024);
        try {
//            nBytes = socket.read(buf);
            socket.read(buf);
            buf.flip();
            Charset charset = Charset.forName("us-ascii");
            CharsetDecoder decoder = charset.newDecoder();
            CharBuffer charBuffer = decoder.decode(buf);
            result = charBuffer.toString();

        } catch(IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void main(String args[]) {
        NonBlockingServer nb = new NonBlockingServer();
        try {
            nb.startServer();
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }
}




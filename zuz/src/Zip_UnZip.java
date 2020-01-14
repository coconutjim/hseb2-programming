/**
 * Created with IntelliJ IDEA.
 * User: Lev
 * Date: 21.01.14
 * Time: 10:47
 * To change this template use File | Settings | File Templates.
 */
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.*;

public class Zip_UnZip {
    File file;
    List<String> files;
    public Zip_UnZip(File f){
        file = f;
    }
    public void Zip(String path){
        byte[] buffer = new byte[1024];

        try {
            FileOutputStream fos = new FileOutputStream(path);
            ZipOutputStream zos = new ZipOutputStream(fos);
            CreateFileList(file);
            for (String name: files){
                zos.putNextEntry(new ZipEntry(name));
                FileInputStream fis = new FileInputStream(file.getParentFile().getAbsolutePath()
                        + File.separator + name);
                int len;
                while ((len = fis.read(buffer)) > 0) {
                    zos.write(buffer, 0, len);
                }
                fis.close();
            }
            zos.closeEntry();
            zos.close();
        } catch (IOException e) {
            System.out.println("Failed zipping into file "+ path);
            return;
        }

    }

    void CreateFileList(File node) {
        files = new ArrayList<String>();
        if(node.isFile()) {
            files.add(GetZipPath(node));
        }

        if(node.isDirectory()) {
            String[] subNote = node.list();
            for(String filename : subNote) {
                CreateFileList(new File(node, filename));
            }
        }
    }

    public String GetZipPath(File node) {
        return file.getName() + File.separator + node.getAbsolutePath().substring(file.getAbsolutePath().length() + 1,
                node.getAbsolutePath().length());
    }
}

package app.utlis;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class ImageUtils {

    public static boolean copyFileUsingStream(MultipartFile file) {
        if (checkImage(file)) {
            File dest = null;
            dest = new File("../books/" + renameBook(file.getOriginalFilename()));
            try (OutputStream outputStream = new FileOutputStream(dest)) {
                byte[] buffer = file.getBytes();
                outputStream.write(buffer);
                return true;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public static String renameBook(String fileName) {
        final String extension = System.nanoTime() + fileName.substring(fileName.lastIndexOf("."));
        return extension;
    }

    public static boolean checkImage(MultipartFile file) {
        String[] allowedExt = {"jpg", "jpeg", "png", "gif"};
        String postFix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        for (String item : allowedExt) {
            if (item.equals(postFix))
                return true;
        }
        return false;
    }
}

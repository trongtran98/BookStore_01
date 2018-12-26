package app.utils;

import com.cloudinary.Cloudinary;
import com.cloudinary.Transformation;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;

public class CloudinaryUtils {

    @Value("${cloud.name}")
    private String cloud;
    @Value("${api.key}")
    private String key;
    @Value("${api.secret}")
    private String secret;



    public Cloudinary startCloudinary() {
        return new Cloudinary(ObjectUtils.asMap(
                "cloud_name", cloud,
                "api_key", key,
                "api_secret", secret));
    }

    public  String upLoadIamge(MultipartFile file) {
        Map uploadResult = null;
        try {
            uploadResult = startCloudinary().uploader().upload(convertMultipartFileToFile(file),
                    ObjectUtils.emptyMap());
        } catch (Exception e) {
        }
        return uploadResult.get("public_id").toString();

    }

    public String loadImageBook(String publicId) {
        String[] arrayUrl = publicId.split("#");
        String urlImage = "";
        for (String url : arrayUrl) {
            urlImage = urlImage + startCloudinary().url().format("jpg")
                    .transformation(new Transformation()
                            .width(350)
                            .height(449).crop("fit"))
                    .generate(url) + "#";
        }

        return urlImage;

    }

    public File convertMultipartFileToFile(MultipartFile file) {
        try {
            File convFile = new File(file.getOriginalFilename());
            convFile.createNewFile();
            FileOutputStream fos = new FileOutputStream(convFile);
            fos.write(file.getBytes());
            fos.close();
            return convFile;

        } catch (IOException e) {
            return null;
        }
    }

}

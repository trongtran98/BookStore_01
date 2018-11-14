package app.helper;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class Helper {
    public static ResponseEntity delete(Integer id, boolean condition) {
        if (id == null || !condition) {
            return ResponseEntity.status(HttpStatus.FAILED_DEPENDENCY).body(null);
        }
        return ResponseEntity.status(HttpStatus.OK).
                body(null);
    }

    public static ResponseEntity createOrUpdate(Object objectDTO, Object object ) {
        if (objectDTO == null || object == null)
            return ResponseEntity.status(HttpStatus.FAILED_DEPENDENCY).body(null);
        return ResponseEntity.status(HttpStatus.OK).body(HttpStatus.OK);
    }
}

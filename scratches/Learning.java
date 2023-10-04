import java.lang.*;
import java.util.*;

import static java.lang.Byte.MAX_VALUE;

class BasicCompletionDemo {

    private int PROCESS_ID = 0;

    public void systemProcess(){
        System.out.println(PROCESS_ID++);
    }

    public BasicCompletionDemo() {
        byte b = MAX_VALUE;
    }

    public void random() {
        Random random = new Random(PROCESS_ID);

    }
}

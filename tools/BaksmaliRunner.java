import com.android.tools.smali.baksmali.Baksmali;
import com.android.tools.smali.baksmali.BaksmaliOptions;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.MultiDexContainer;

import java.io.File;

public class BaksmaliRunner {
    public static void main(String[] args) throws Exception {
        MultiDexContainer container = DexFileFactory.loadDexContainer(
                new File(args[0]), new Opcodes(19, -1));
        String name = (String) container.getDexEntryNames().get(0);
        DexBackedDexFile dex = (DexBackedDexFile) container.getEntry(name).getDexFile();
        BaksmaliOptions options = new BaksmaliOptions();
        Baksmali.disassembleDexFile(dex, new File(args[1]), 1, options);
        System.out.println("disassembled " + name + " -> " + args[1]);
    }
}

package com.muta.yanxi.offline;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.Toast;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;

/**
 * 透明中转页：用系统文件选择器导入剧本 JSON 到 files/yanxi1.json。
 * Live2D 引擎启动时会优先读取该文件，因此导入后需要重启应用。
 */
public class ScriptImportActivity extends Activity {

    private static final int REQ_PICK = 1;
    private static final String SCRIPT_FILE = "yanxi1.json";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            Intent i = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            i.addCategory(Intent.CATEGORY_OPENABLE);
            i.setType("*/*");
            startActivityForResult(i, REQ_PICK);
        } catch (Throwable t) {
            try {
                Intent i = new Intent(Intent.ACTION_GET_CONTENT);
                i.setType("*/*");
                startActivityForResult(i, REQ_PICK);
            } catch (Throwable t2) {
                toast("没有可用的文件选择器");
                finish();
            }
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQ_PICK) {
            finish();
            return;
        }
        if (resultCode != RESULT_OK || data == null || data.getData() == null) {
            finish();
            return;
        }
        try {
            String text = read(data.getData());
            // 先校验是合法 JSON，避免把坏文件写进去导致下次启动异常
            new JSONObject(text);
            File out = new File(getFilesDir(), SCRIPT_FILE);
            FileOutputStream fos = new FileOutputStream(out);
            fos.write(text.getBytes("UTF-8"));
            fos.close();
            toast("剧本已导入，重启嫣汐后生效");
        } catch (Throwable t) {
            toast("导入失败：文件不是有效的 JSON");
        }
        finish();
    }

    private String read(Uri uri) throws Exception {
        InputStream in = getContentResolver().openInputStream(uri);
        if (in == null) {
            throw new Exception("无法读取文件");
        }
        BufferedReader br = new BufferedReader(new InputStreamReader(in, "UTF-8"));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line).append('\n');
        }
        br.close();
        return sb.toString();
    }

    private void toast(String msg) {
        Toast.makeText(this, msg, Toast.LENGTH_LONG).show();
    }
}

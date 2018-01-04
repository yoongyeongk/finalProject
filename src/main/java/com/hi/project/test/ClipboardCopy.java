package com.hi.project.test;

import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;

public class ClipboardCopy {

	public void copyClipboard(){
		Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
		String copy = "copy test";
		
		if(copy != null){
			StringSelection contents = new StringSelection(copy);
			clipboard.setContents(contents, null);
		}		
	}
	
	public void paste() {
		
	}
}

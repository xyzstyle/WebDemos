/*
 * Created on 2015-11-10
 */

package xyz.service;

/**
 * @author xyz
 *
 */
public class BaseService {
	protected String message;

	/**
	 * @return Returns the message.
	 */
	public String getMessage() {
		if(message==null)
			message="";
		return message;
	}
	/**
	 * @param message The message to set.
	 */
	public void setMessage(String message) {
		this.message = message;
	}
}

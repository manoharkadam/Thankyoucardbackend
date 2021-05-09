/**
 * 
 */
package com.hssa.hr.model;

/**
 * @author USER
 *
 */
public class UpdateLeadRequest {
	private int seqlidID;
	public int getSeqlidID() {
		return seqlidID;
	}
	public void setSeqlidID(int seqlidID) {
		this.seqlidID = seqlidID;
	}
	private String emailAddress;
	private String region;
	private String locality;
	private String business;
	private String devtype;
	private String company;
	private String stage;
	private String summary;
	private String deviceID;
	private String latitude;
	private String longitude;
	private String leadassigned;
	private String leadassignedDate;
	private String leadassignedByUser;
	
	private String source;
	
	public String getLeadassigned() {
		return leadassigned;
	}
	public void setLeadassigned(String leadassigned) {
		this.leadassigned = leadassigned;
	}
	public String getLeadassignedDate() {
		return leadassignedDate;
	}
	public void setLeadassignedDate(String leadassignedDate) {
		this.leadassignedDate = leadassignedDate;
	}
	public String getLeadassignedByUser() {
		return leadassignedByUser;
	}
	public void setLeadassignedByUser(String leadassignedByUser) {
		this.leadassignedByUser = leadassignedByUser;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getDeviceID() {
		return deviceID;
	}
	public void setDeviceID(String deviceID) {
		this.deviceID = deviceID;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getLocality() {
		return locality;
	}
	public void setLocality(String locality) {
		this.locality = locality;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public String getDevtype() {
		return devtype;
	}
	public void setDevtype(String devtype) {
		this.devtype = devtype;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
}

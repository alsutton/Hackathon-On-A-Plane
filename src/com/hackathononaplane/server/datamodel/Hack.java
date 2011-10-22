package com.hackathononaplane.server.datamodel;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.users.User;

@PersistenceCapable
public class Hack {

	/**
	 * Primary key for the hack
	 */

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key id;

    /**
     * The accessor identifier
     */

    @Persistent
    private User user;

    /**
     * The name of the hack
     */

	@Persistent
    private String name;

	/**
	 * The changeset URL
	 */

	@Persistent
	private String changesetURL;

	/**
	 * The current voting score
	 */

	@Persistent
	private int voteScore;

	/**
	 * The number of reports
	 */

	@Persistent
	private int reports;

	/**
	 * The amount of time on the plane
	 */

	private int planeTime;

	/**
	 * Public constructor
	 */

	public Hack() {
		super();
	}

	public Key getId() {
		return id;
	}

	public void setId(Key id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getChangesetURL() {
		return changesetURL;
	}

	public void setChangesetURL(String changesetURL) {
		this.changesetURL = changesetURL;
	}

	public int getVoteScore() {
		return voteScore;
	}

	public void setVoteScore(int voteScore) {
		this.voteScore = voteScore;
	}

	public int getReports() {
		return reports;
	}

	public void setReports(int reports) {
		this.reports = reports;
	}

	public int getPlaneTime() {
		return planeTime;
	}

	public void setPlaneTime(int planeTime) {
		this.planeTime = planeTime;
	}
}

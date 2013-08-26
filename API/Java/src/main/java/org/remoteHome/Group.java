package org.remoteHome;

/**
 * Created with IntelliJ IDEA.
 * User: dr
 * Date: 8/26/13
 * Time: 3:54 PM
 * To change this template use File | Settings | File Templates.
 */
public class Group {
    private int groupId;
    private String groupName;

    public Group() {}

    public Group(int groupId, String groupName) {
        this.groupId = groupId;
        this.groupName = groupName;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
}

package org.remoteHome;

/**
 * Created with IntelliJ IDEA.
 * User: dr
 * Date: 8/26/13
 * Time: 3:54 PM
 * To change this template use File | Settings | File Templates.
 */
public class Group {
    private String groupName;

    public static final Group ADMIN_GROUP = new Group("Administrators");
    public static final Group OPERATOR_GROUP = new Group("Operators");
    public static final Group GUEST_GROUP = new Group("Guests");

    public Group() {}

    public Group(String groupName) {
        this.groupName = groupName;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
    @Override
    public boolean equals(Object o) {
        if (!(o instanceof Group)) return false;
        return ((Group)o).getGroupName().equals(groupName);
    }
    
    @Override
    public int hashCode() {
        if (getGroupName().isEmpty()) return 0;
        else return getGroupName().charAt(0);
    }
}

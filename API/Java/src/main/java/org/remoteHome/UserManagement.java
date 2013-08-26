package org.remoteHome;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: dr
 * Date: 8/25/13
 * Time: 7:54 PM
 * To change this template use File | Settings | File Templates.
 */
public class UserManagement {

    private List<User> users = new ArrayList<User>();
    private boolean isLoggedOn = false;
    private User loggedOnUser = new User();

    public final User ADMIN = new User(0, "admin", "admin", new Group(0, "Admnistrator"));

    public void init() {
        users.add(ADMIN);
    }

    public boolean isLoggedOn() {
        return isLoggedOn;
    }

    public void setLoggedOn(boolean loggedOn) {
        isLoggedOn = loggedOn;
    }

    public User getLoggedOnUser() {
        return loggedOnUser;
    }

    public void setLoggedOnUser(User loggedOnUser) {
        this.loggedOnUser = loggedOnUser;
    }

    class User {
        private int userId;
        private String userName;
        private String password;
        private Group group;

        public User() {}

        public User(int userId, String userName, String password, Group group) {
            this.userId = userId;
            this.userName = userName;
            this.password = password;
            this.group = group;
        }

        int getUserId() {
            return userId;
        }

        void setUserId(int userId) {
            this.userId = userId;
        }

        String getUserName() {
            return userName;
        }

        void setUserName(String userName) {
            this.userName = userName;
        }

        String getPassword() {
            return password;
        }

        void setPassword(String password) {
            this.password = password;
        }

        Group getGroup() {
            return group;
        }

        void setGroup(Group group) {
            this.group = group;
        }
    }

    class Group {
        private int groupId;
        private String groupName;

        public Group() {}

        public Group(int groupId, String groupName) {
            this.groupId = groupId;
            this.groupName = groupName;
        }

        int getGroupId() {
            return groupId;
        }

        void setGroupId(int groupId) {
            this.groupId = groupId;
        }

        String getGroupName() {
            return groupName;
        }

        void setGroupName(String groupName) {
            this.groupName = groupName;
        }
    }

}

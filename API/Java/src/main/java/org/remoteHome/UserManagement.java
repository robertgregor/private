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
    public final User ADMIN = new User(0, "admin", "admin", new Group(0, "Admnistrator"));

    public void init() {
        users.add(ADMIN);
    }

    class User {
        private int userId;
        private String userName;
        private String password;
        private Group group;

        public User(int userId, String userName, String password, Group group) {
            this.userId = userId;
            this.userName = userName;
            this.password = password;
            this.group = group;
        }

    }

    class Group {
        private int groupId;
        private String groupName;

        public Group(int groupId, String groupName) {
            this.groupId = groupId;
            this.groupName = groupName;
        }
    }

}

package org.remoteHome;

/**
 * Created with IntelliJ IDEA.
 * User: dr
 * Date: 8/25/13
 * Time: 7:54 PM
 * To change this template use File | Settings | File Templates.
 */
public class UserManagement {

    class User {
        private int userId;
        private String userName;
        private String password;
        private Group group;
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

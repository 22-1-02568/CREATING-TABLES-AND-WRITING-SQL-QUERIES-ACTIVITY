-- 1. Select all users born between January 1, 2000 and December 31, 2004
SELECT * FROM Users
WHERE BirthDate BETWEEN '2000-01-01' AND '2004-12-31';

-- 2. Select all posts written by the user with a UserID of 4
SELECT * FROM UserPosts
WHERE AuthorID = 4;

-- 3. Select all the group titles in the database
SELECT GroupTitle FROM CommunityGroups;

-- 4. Select all the group membership requests made by the user with a UserID of 2
SELECT * FROM GroupMembershipRequests
WHERE UserID = 2;

-- 5. Select all the friends of the user with a UserID of 2
SELECT * FROM FriendConnections
WHERE UserOneID = 2 OR UserTwoID = 2;

-- 6. Select all the friend requests that a user with a UserID of 1 has sent, whether accepted or not
SELECT * FROM FriendRequests
WHERE SenderID = 1;

-- 7. Select all the posts visible only for the group with a GroupID of 2
SELECT UserPosts.* 
FROM UserPosts 
JOIN CommunityGroupPosts ON UserPosts.PostID = CommunityGroupPosts.PostID
WHERE CommunityGroupPosts.GroupID = 2 AND UserPosts.Visibility = TRUE;

-- 8. Select all the group membership requests from the group with a GroupID of 2 that are not yet accepted
SELECT * FROM GroupMembershipRequests
WHERE GroupID = 2 AND ApprovalStatus = FALSE;

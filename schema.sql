-- Create Users Table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    Password VARCHAR(255),
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Posts Table
CREATE TABLE UserPosts (
    PostID INT AUTO_INCREMENT PRIMARY KEY,
    PostContent VARCHAR(500),
    AuthorID INT,
    Visibility BOOLEAN,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AuthorID) REFERENCES Users(UserID)
);

-- Create Comments Table
CREATE TABLE PostComments (
    CommentID INT AUTO_INCREMENT PRIMARY KEY,
    CommentText VARCHAR(500),
    CommenterID INT,
    ParentPostID INT,
    CommentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CommenterID) REFERENCES Users(UserID),
    FOREIGN KEY (ParentPostID) REFERENCES UserPosts(PostID)
);

-- Create Groups Table
CREATE TABLE CommunityGroups (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupTitle VARCHAR(150),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Group Memberships Table
CREATE TABLE GroupMembershipRequests (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    GroupID INT,
    UserID INT,
    ApprovalStatus BOOLEAN DEFAULT FALSE,
    RequestedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (GroupID) REFERENCES CommunityGroups(GroupID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Friendship Table
CREATE TABLE FriendConnections (
    ConnectionID INT AUTO_INCREMENT PRIMARY KEY,
    UserOneID INT,
    UserTwoID INT,
    BecameFriendsOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserOneID) REFERENCES Users(UserID),
    FOREIGN KEY (UserTwoID) REFERENCES Users(UserID)
);

-- Create Friend Request Table
CREATE TABLE FriendRequests (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    SenderID INT,
    ReceiverID INT,
    IsApproved BOOLEAN DEFAULT FALSE,
    RequestedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);

-- Create Group Posts Table
CREATE TABLE CommunityGroupPosts (
    GroupPostID INT AUTO_INCREMENT PRIMARY KEY,
    GroupID INT,
    PostID INT,
    FOREIGN KEY (GroupID) REFERENCES CommunityGroups(GroupID),
    FOREIGN KEY (PostID) REFERENCES UserPosts(PostID)
);

-- Insert into Users Table
INSERT INTO Users (UserID, Username, FirstName, LastName, BirthDate, Password) VALUES
(1, 'GigaBrain', 'Alfie', 'Palmera', '2000-07-11', 'alfie_password'),
(2, 'RyanGosling', 'John', 'Robert', '2003-06-21', 'john_password'),
(3, 'Malupiton', 'Mark', 'Galicha', '1997-04-25', 'mark_password'),
(4, 'TransformerHunter', 'Andrei', 'Pabello', '2000-12-26', 'andrei_password'),
(5, 'JeffreyDahmer', 'Heiroll', 'Magcalas', '2001-08-11', 'heiroll_password');

-- Insert into UserPosts Table
INSERT INTO UserPosts (PostID, PostContent, AuthorID, Visibility) VALUES
(1, 'Eimi Fukada’s latest is a must-watch!', 1, TRUE),
(2, 'Yamate Ria in her best role yet!', 2, TRUE),
(3, 'Yui Tenma is so underrated!', 3, TRUE),
(4, 'MINAMO’s new album is fire!', 4, TRUE),
(5, 'Rei Kamiki’s success story is inspiring!', 5, TRUE),
(6, 'Eyyy ka muna, break muna from coding.', 1, FALSE),
(7, 'Morishita Kotono’s exhibit is amazing!', 2, TRUE),
(8, 'Mei Washio’s best performance yet!', 3, TRUE),
(9, 'Marui Moeka’s book is unputdownable!', 4, TRUE),
(10, 'Hibiki Natsume’s recipes are back!', 5, TRUE);

-- Insert into CommunityGroups Table
INSERT INTO CommunityGroups (GroupID, GroupTitle) VALUES
(1, 'Yellow Hub'),
(2, 'ticnaP notnaC Gang');

-- Insert into GroupMembershipRequests Table
INSERT INTO GroupMembershipRequests (RequestID, GroupID, UserID, ApprovalStatus) VALUES
(1, 1, 1, TRUE),
(2, 1, 3, FALSE),
(3, 2, 2, TRUE),
(4, 2, 4, FALSE),
(5, 2, 5, TRUE);

-- Insert into FriendConnections Table
INSERT INTO FriendConnections (ConnectionID, UserOneID, UserTwoID) VALUES
(1, 1, 2),
(2, 3, 5),
(3, 4, 2);

-- Insert into FriendRequests Table
INSERT INTO FriendRequests (RequestID, SenderID, ReceiverID, IsApproved) VALUES
(1, 1, 3, FALSE),
(2, 2, 4, TRUE),
(3, 5, 1, TRUE),
(4, 1, 2, FALSE);

-- Insert into CommunityGroupPosts Table
INSERT INTO CommunityGroupPosts (GroupPostID, GroupID, PostID) VALUES
(1, 1, 2),
(2, 2, 4),
(3, 2, 5);

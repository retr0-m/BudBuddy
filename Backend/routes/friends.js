

// Backend/routes/friends.js
const express = require("express");
const router = express.Router();
const User = require("../models/User");
const authMiddleware = require("../middleware/auth"); // make sure you have JWT auth

// GET incoming friend requests
router.get("/requests", authMiddleware, async (req, res) => {
    try {
        const user = await User.findById(req.user.id).populate("friendRequests", "username email");
        res.json(user.friendRequests || []);
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: "Server error" });
    }
});

module.exports = router;
// POST /api/friends/accept/:id

router.post("/accept/:id", authMiddleware, async (req, res) => {
    try {
        const userId = req.user.id;   // now comes from token
        const senderId = req.params.id;

        const user = await User.findById(userId);
        const sender = await User.findById(senderId);

        if (!user.friendRequests.includes(senderId)) {
            return res.status(400).json({ message: "No request from this user" });
        }

        user.friendRequests = user.friendRequests.filter(
            (id) => id.toString() !== senderId
        );
        user.friends.push(senderId);
        sender.friends.push(userId);

        await user.save();
        await sender.save();

        res.json({ message: "Friend request accepted" });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: "Server error" });
    }
});

// GET /api/friends/search?username=abc
router.get("/search", authMiddleware, async (req, res) => {
    const { username } = req.query;
    if (!username) return res.status(400).json({ message: "Username is required" });

    try {
        const users = await User.find({
            username: { $regex: username, $options: "i" } // case-insensitive search
        }).select("id username email nil nil");
        res.json(users);
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: "Server error" });
    }
});

// GET /api/friends/user/:id - get user by id (id, username)
router.get("/user/:id", authMiddleware, async (req, res) => {
    try {
        const user = await User.findById(req.params.id).select("_id username");
        console.log("asked for a user with id: ", user);
        if (!user) {
            return res.status(404).json({ message: "User not found" });
        }
        // Return "id" instead of "_id"
        res.json({
            _id: user.id,
            username: user.username
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: "Server error" });
    }
});


// POST /api/friends/request/:id
router.post("/request/:id", authMiddleware, async (req, res) => {
    const senderId = req.user.id;
    const receiverId = req.params.id;

    try {
        const receiver = await User.findById(receiverId);
        if (!receiver) return res.status(404).json({ message: "User not found" });

        if (receiver.friendRequests.includes(senderId)) {
            return res.status(400).json({ message: "Request already sent" });
        }

        receiver.friendRequests.push(senderId);
        await receiver.save();

        res.json({ message: "Friend request sent" });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: "Server error" });
    }
});

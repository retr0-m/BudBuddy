
// Backend/server.js
const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
require("dotenv").config();

const app = express();
app.use(express.json());
app.use(cors());

// Connect DB
const connectDB = require("./config/db");
connectDB();

// Routes
app.use("/api/auth", require("./routes/auth"));


const PORT = process.env.PORT || 8080; // change from 5000
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));


const friendsRoutes = require("./routes/friends");
app.use("/api/friends", friendsRoutes);


router.post("/", async (req, res) => {
    const newActivity = new Activity({
        user: req.user.id,
        title: req.body.title,
        description: req.body.description
    });
    await newActivity.save();
    res.json(newActivity);
});

router.get("/friend/:id", async (req, res) => {
    const friendId = req.params.id;
    const activities = await Activity.find({ user: friendId }).sort({ createdAt: -1 });
    res.json(activities);
});
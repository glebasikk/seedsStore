const userRepo = require("../repository/user");
const tokenGenerator = require("../midleware/tokenGenerator")
const session = require("../repository/session");
const bcrypt = require("bcrypt");
const NotFound = require("../errors/NotFound");
const Unauthorized = require("../errors/Unauthorized");
const BadRequest = require("../errors/BadRequest");


class Auth {
    async registration(data) {
        if ((await userRepo.findUserByUsername(data.username)) !== null) {
            throw new BadRequest("user exist");
        }
        data.password = bcrypt.hashSync(data.password, 5);
        data.userRole = "admin"
        return await userRepo.addUser(data);
    }
    async changePassword(data) {
        if ((await userRepo.findUserByUsername(data.username)) == null) {
            throw new NotFound("user does not exist");
        }
        const user = await userRepo.findUserByUsername(data.username);
        const validPassword = bcrypt.compareSync(data.password, user.password);
        if (!validPassword) {
            throw new Unauthorized("Incorrect password");
        }
        data.newPassword = bcrypt.hashSync(data.newPassword, 5);
        let result = await userRepo.changePassword(data);
        if (result[0] > 0){
            return true
        }
        return false
    }
    async login(data) {
        if ((await userRepo.findUserByUsername(data.username)) == null) {
            throw new NotFound("user does not exist");
        }
        const user = await userRepo.findUserByUsername(data.username);
        const validPassword = bcrypt.compareSync(data.password, user.password);
        if (!validPassword) {
            throw new Unauthorized("Incorrect password");
        }
        data.userId = user.dataValues.id
        const token = tokenGenerator.generateToken(user);
        data.token = token

        await session.delSession(data)
        await session.addSession(data)
        return { token};
    }
    async session() {
        let data = {}
        data.username = "guest"
        data.password = "guest"
        data.userRole = "guest"
        let user = await userRepo.addUser(data);
        data.userId = user.dataValues.id
        const token = tokenGenerator.generateToken(user);
        data.token = token
        
        await session.delSession(data)
        await session.addSession(data)
        return { token};
    }
}

module.exports = new Auth();

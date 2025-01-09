const multer = require('@koa/multer');
const { UPLOAD_PATH } = require('../config/path');

const uploadAvatar = multer({
  dest: UPLOAD_PATH,
  fileFilter(req, file, cb) {
    // 文件类型过滤，只允许图片上传
    const fileTypes = /jpeg|jpg|png|gif/;
    const mimeType = fileTypes.test(file.mimetype);
    const extname = fileTypes.test(
      path.extname(file.originalname).toLowerCase(),
    );
    if (mimeType && extname) {
      return cb(null, true);
    }
    cb(new Error('只允许上传图片文件！'));
  },
});

const uploadDiskStorage = multer({
  storage: multer.diskStorage({
    destination(req, file, cb) {
      cb(null, UPLOAD_PATH);
    },
    filename(req, file, cb) {
      cb(null, Date.now() + '_' + file.originalname);
    },
    fileFilter(req, file, cb) {
      // 文件类型过滤，只允许图片上传
      const fileTypes = /jpeg|jpg|png|gif/;
      const mimeType = fileTypes.test(file.mimetype);
      const extname = fileTypes.test(
        path.extname(file.originalname).toLowerCase(),
      );
      console.log(file);
      if (mimeType && extname) {
        return cb(null, true); // 文件类型合法
      }
      cb(new Error('只允许上传图片文件！'));
    },
  }),
});
const handleAvatar = uploadAvatar.single('avatar');

const handleDiskArray = uploadDiskStorage.array('avatar');
const handleDiskSingle = uploadDiskStorage.single('avatar');

module.exports = {
  handleAvatar,
  handleDiskArray,
  handleDiskSingle,
};

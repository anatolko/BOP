var gulp             = require('gulp');
var concat           = require('gulp-concat');
var gulpFilter       = require('gulp-filter');
var mainBowerFiles   = require('main-bower-files');

gulp.task('libs', function () {
    var jsFilter = gulpFilter('**/*.js', {restore: true});  //отбираем только  javascript файлы
    var cssFilter = gulpFilter('**/*.css', {restore: true});  //отбираем только css файлы
    return gulp.src(mainBowerFiles())
        .pipe(jsFilter)
        .pipe(concat('libs.js'))
        .pipe(gulp.dest('js'))
        .pipe(jsFilter.restore)

        .pipe(cssFilter)
        .pipe(concat('libs.css'))
        .pipe(gulp.dest('css/'));
});

gulp.watch('bower.json',['libs']);
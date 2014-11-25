path = require "path"
module.exports = (grunt) ->
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-stylus"
    grunt.loadNpmTasks "grunt-contrib-jade"

    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-concurrent"
    grunt.loadNpmTasks "grunt-nodemon"

    grunt.registerTask "default", ["compile", "concurrent:dev"]
    grunt.registerTask "compile", ["coffee:compile", "stylus:compile", "jade:compile"]

    grunt.initConfig
        srcDir: path.join __dirname, "src"
        distDir: path.join __dirname, "dist"

        coffee:
            options: {}
            compile:
                files:
                    "dist/app/index.js": ["src/app/index.coffee"]
                    "dist/app/app.js": ["src/app/app.coffee"]

        stylus:
            options: {}
            compile:
                files:
                    "dist/public/css/app.css": ["src/styl/main.styl"]

        jade:
            options: {}
            compile:
                files:
                    "dist/public/index.html": ["src/templates/index.jade"]

        watch:
            options: {}
            coffee:
                files: ["src/app/**/*.coffee"]
                tasks: ["coffee:compile"]

            stylus:
                files: ["src/styl/*.styl"]
                tasks: ["stylus:compile"]

            jade:
                files: ["src/templates/**/*.jade"]
                tasks: ["jade:compile"]

        nodemon:
            options:
                ignore: ["node_modules/**"]

            dev:
                script: "dist/app/index.js"
                watch: ["dist/app"]
                env:
                    PORT: process.env.PORT or 3000
                    HOST: process.env.HOST or "127.0.0.1"

        concurrent:
            options:
                logConcurrentOutput: true

            dev:
                tasks: ["nodemon", "watch"]

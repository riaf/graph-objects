# grunt.coffee

module.exports = (grunt) ->

  grunt.loadNpmTasks "grunt-coffee"
  grunt.registerTask "default", "coffee concat min"

  grunt.initConfig
    coffee:
      all:
        src: ["src/*.coffee"]
        dest: "dist/js"
        options:
          bare: false
    concat:
      dist:
        src: ["dist/js/base.js", "dist/js/*.js"]
        dest: "dist/graph-object.js"
    min:
      dist:
        src: ["dist/graph-object.js"]
        dest: "dist/graph-object.min.js"
    watch:
      all:
        files: "<config:coffee.all.src>"
        tasks: "coffee concat min"


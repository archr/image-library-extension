module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      dev:
        options:
          bare: true
        expand: true
        cwd: 'ext/coffee/'
        src: ['*.coffee']
        dest: 'ext/js/'
        ext: '.js'

    watch:
      coffee:
        files: ['ext/coffee/*.coffee']
        tasks: ['coffee:dev']

    crx: 
      dev:
        src: 'ext/'
        dest: 'dist/'


  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-crx'
  

  grunt.registerTask 'default', ['watch:coffee']
  grunt.registerTask 'crx', ['crx:dev']
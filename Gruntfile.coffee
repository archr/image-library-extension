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
        src: "ext/"
        dest: "dist/"
        privateKey: ".ssh/ext.pem"
        baseURL: 'http://198.199.115.150:4000/'

    multiresize:
      ext:
        src: 'ext/img/grumpy.jpeg'
        dest: ['ext/img/icon-16.png', 'ext/img/icon-38.png']
        destSizes: ['16x16', '38x38']


  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-crx'
  grunt.loadNpmTasks 'grunt-multiresize'
  

  grunt.registerTask 'default', ['watch:coffee']
  grunt.registerTask 'distribution', ['crx:dev']
  grunt.registerTask 'compile', ['coffee:dev']
  grunt.registerTask 'resize', ['multiresize:ext']

  return 


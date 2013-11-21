module.exports = (grunt) ->
  
  grunt.initConfig

    clean:
      app: ['app/*']
      subgenerator: ['subgenerator/*']
      test: ['test/*']

    copy:
      app:
        expand: true
        cwd: 'src/app'
        src: 'templates/**/*'
        dest: 'app/'

      subgenerator:
        expand: true
        cwd: 'src/subgenerator'
        src: 'templates/**/*'
        dest: 'subgenerator/'

      test:
        expand: true
        cwd: 'src/test'
        src: ['temp/**/*', 'tempsub/**/*']
        dest: 'test/'

    coffee:
      src:
        expand: true
        cwd: 'src/app/'
        src: 'index.coffee'
        dest: 'app/'
        ext: '.js'

      subgenerator:
        expand: true
        cwd: 'src/subgenerator/'
        src: 'index.coffee'
        dest: 'subgenerator/'
        ext: '.js'

      test:
        expand: true
        cwd: 'src/test/'
        src: ['test-creation.coffee', 'test-import.coffee']
        dest: 'test/'
        ext: '.js'

    watch:
      src:
        files: 'src/**/*'
        tasks: ['default']

  
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-mocha'
  
  grunt.registerTask 'build', ['clean', 'copy', 'coffee']
  grunt.registerTask 'test', ['build']
  grunt.registerTask 'default', ['test']

# INSTRUCTIONS FOR RELEASING VERIFALIA JAVA SDK TO MAVEN CENTRAL VIA SONATYPE OSS NEXUS #

## Preface ##

This procedure explains how to set up environment and make releases on the Windows operating system.


## Setting Up Local Environment ##

1. Install latest JDK 1.8  (**NOTE:** You need **JDK**, not only JRE, download installer from http://www.oracle.com/technetwork/java/javase/downloads/index.html)

2. Install Git (download installer from from https://git-scm.org), configure it properly.

3. Install Apache Maven (download archive with latest stable release binaries from http://maven.apache.org, unpack it to the some place of your choice, and add to PATH).
    + **NOTE**: I have had an th follwing expirience: some Maven task failed to execute because it didn't find file `mvn.bat` in the Maven `bin` directory. Actually, Windows version of Maven supplies `mvn.cmd` and it works in the most cases. But if you face such issue in the Maven build log, please go to the Maven `bin` directory and copy file `mvn.cmd` into `mvn.bat`, and try running Maven once again. 

4. Install Gpg4Win (download installer from http://gpg4win.org/download.html).

5. Run *GNU Privacy Assistant* *(GPA)*, a program installed as part of the Gpg4Win package, and generate new GPG key. You will need it for the purpose of the code signing. Make sure you have defined good name for the key and good passphrase. 

6. Publish your public key to key server.

7. Initialize local Maven repository. The easiest way to do this is to build Verifalia SDK for Java using Maven for a one time. Clone Verifalia Java SDK GitHub repository and follow instructions given in the SDK's README.md. As result you will have directory C:\Users\<your-user-name>\.m2 with some content.

8. Run the command `mvn --encrypt-master-password` and enter you master password when it asks. As result it will print you a string like this:
`{fO6IjN+vTWQH3G+qNzzw8dBSu914mljETQKoiE3mwCU=}`, which represents encrypted master password. 

9. Create file `C:\Users\<your-user-name>\.m2\settings-security.xml` with content like this:
    ```xml
    <settingsSecurity>
	    <master>{fO6IjN+vTWQH3G+qNzzw8dBSu914mljETQKoiE3mwCU=}</master>
    </settingsSecurity>
    ```
    Put encrypted master password into it.
    From now on, each time you need to put password into Maven `settings.xml` file, use the following command to encrypt it:
    ```shell
    mvn --ecnrypt-password <the-password-to-be-encrypted>
    ```
    **NOTE:** When you will be later encrypting other passwords, rarely, you may get the following error: 
    ```text
    [ERROR] Error executing Maven.
    [ERROR] javax.crypto.BadPaddingException: Given final block not properly padded
    [ERROR] Caused by: Given final block not properly padded
    ```
    To mitigate this issue just run password encryption once again - encryption generates each time a different variant even for the same password. Refer here for the more info: http://stackoverflow.com/questions/31525691/maven-password-encryption-badpaddingexception

10. Configure `settings.xml` or the Sonatype deployment. You need to create file `C:\Users\<your-user-name>\.m2\settings.xml` with the following content (make sure to replace designated parts with your actual data, like Sonatype account credentials):
    ```xml
    <settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">

	<localRepository/>

	<interactiveMode/>

	<usePluginRegistry/>

	<offline/>

	<pluginGroups/>

	<servers>
		<server>
			<id>ossrh</id>
			<!-- your-Sonatype-jira-id -->
			<username>YOUR SONATYPE JIRA USER NAME HERE</username>
			<!-- your-Sonatype-jira-password -->
			<password>YOUR ENCRYPTED SONTYPE PASSWORD HERE</password>
		</server>
	</servers>

	<mirrors/>

	<proxies/>

	<profiles>
		<profile>
			<id>ossrh</id>
			<activation>
				<activeByDefault>true</activeByDefault>
			</activation>
			<properties>
				<!-- please check your actual Gpgp4Win installation path -->
				<gpg.executable>C:&#x005c;Program Files (x86)&#x005c;GNU&#x005c;GnuPG&#x005c;gpg2.exe</gpg.executable>
				<gpg.passphrase>YOU GPG KEY PASSPHRASE HERE (NOT ENCRYPTED!!!!) (PLEASE NOTE YOU MAY NEED TO USE HERE SPECIAL SYMBOLS ENCODING like &gt; &lt; etc.)</gpg.passphrase>
				<gpg.keyname>YOUR GPG KEY NAME HERE(PLEASE NOTE YOU MAY NEED TO USE HERE SPECIAL SYMBOLS ENCODING like &gt; &lt; etc.)</gpg.keyname>
			</properties>
		</profile>
	</profiles>

	<activeProfiles/>
    </settings>
    ```

11. Greetings, you have finished the environment preparation procedure.


## Release Deployment Procedure ##

1. Make sure you have finished some your internal official SDK version approval process, so you know exact version number and Git revision to be published as official SDK version.

2. Clone and update GitHub repo to the approved release revision. **NOTE**: If it is not a HEAD revision, you will need additionally to create new branch for making release, because you will be doing changes to project files during the release deployment procedure.

3. Make sure the SDK code builds and signs well. To do this, run Maven as follows:
    ```shell
    mvn install -Psignature-test -X 2>&1 >maven-build-test.log
    ```
    **NOTE:** I suggest to always use option `-X` (print Maven debug info), as long as it often gives key info for the troubleshooting various issue.

4. Review log file `maven-build-test.log`, make sure build was successful. Fix any issues. Make sure you have committed any changes you've made into Git repository.

5.  Edit file `pom.xml`: put your non-SNAPSHOT release version into the `<version>` tag:
    ```xml
        <version>1.0.0</version>
    ```

6. Put Git release tag name into the `<tag>` tag in the `<scm>` section (**but** don't add the tag in Git yet, you are going to create this tag in the one of the next steps):
    ```xml
    <scm>
        <url>git@github.com:verifalia/verifalia-java-sdk.git</url>
        <connection>scm:git:git@github.com:verifalia/verifalia-java-sdk.git</connection>
        <developerConnection>scm:git:git@github.com:verifalia/verifalia-java-sdk.git</developerConnection>
        <tag>verifalia-java-sdk-1.0.0</tag>
    </scm>
```

7. Commit pom.xml with appropriate comment:
    ```shell
    git add pom.xml
    git commit -m "Edited pom.xml for the release 1.0.0"
    ```

8. Add release tag in Git:
    ```shell
    git tag verifalia-java-sdk-1.0.0 -a -m "release 1.0.0"
    ```

9. Push file changes and tag to GitHub repo, like this:
    ```
    git push origin master
    git push origin --tags
    ```

10. Now run Maven as follows:
    ```shell 
    mvn clean deploy -Pstage 2>&1 >deploy-to-stage.log
    ```

11. Review log, make sure everything is fine. If you have issues: fix any issues, commit changes and move release tag if you have changed some files in the GitHub repo. Then, run abovementioned Maven command again.

12. From the log, you will find staging repository name, it will look like `comgithubverifalia-NNNN`, where `NNNN` is an automatically assigned 4-digit number, numbers start from 1000 and increase sequentially.

13. Inspect your staging repository in the Sonatype OSS Nexus. 

14. Follow the instructions published on the Sonatype website http://central.sonatype.org/pages/releasing-the-deployment.html to perform actual release submission to the Maven Central.

15. Or, alternatively, you can run Maven command that should perform the same:
    ```xml
    mvn nexus-staging:release -Prelease
    ```
    + **NOTE #1** This step information is take from here: http://central.sonatype.org/pages/apache-maven.html#nexus-staging-maven-plugin-for-deployment-and-release I did not validated myself this step, as long as I don't want to actually publish my test project into Maven Cenral. So you may try doing that yourself, by publishing some 0.0.x SDK pre-release version for testing purposes.
    + **NOTE #2** In order to run this command correctly. You need to use proper Maven profile name in the command that will provide Nexus Staging plugin with necessary server connection info. This is defined by parameter `-Prelease` which you may have noticed above. You may see definitions of the custom profiles I've prepared in the project file `pom.xml`.

16. **RIGHT AFTER** the above described procedure has succeeded, you need to edit `pom.xml` again in order to advance Verifalia Java SDK project to a new development version. So at this step, please edit `pom.xml`, put new `X.Y.Z-SNAPSHOT` version into `<version>` tag (typically new sequential version, i.e. if you have released version `1.0.1`, next development version will be `1.0.2-SNAPSHOT`), and REMOVE `<tag>` tag from the `<scm>` section, because development version does not have fixed release tag.

17. Commit modified `pom.xml` to Git repository and push to GitHub.
 
## Resources ##

Following resources are strongly suggested for studying in order to reach more expertise and find additional information:

1. Sonatype Getting Started guide for Producers http://central.sonatype.org/pages/producers.html
2. Sonatype project publishing guide for Apache Maven http://central.sonatype.org/pages/apache-maven.html
3. Sonatype project requirement for publishing to Maven Central http://central.sonatype.org/pages/requirements.html
4. Sonatype OSSRH guide http://central.sonatype.org/pages/ossrh-guide.html
5. Sonatyoe Guide for working with PGP Signatures http://central.sonatype.org/pages/working-with-pgp-signatures.html
6. Using a local repo manager and OSSRH http://central.sonatype.org/articles/2014/Mar/25/using-a-local-repo-manager-and-ossrh/
7. Apache Maven documentation http://maven.apache.org/guides/index.html
8. Apache Maven GPG plugin documentation https://maven.apache.org/plugins/maven-gpg-plugin/
9. Nexus Staging Maven Plugin https://github.com/sonatype/nexus-maven-plugins/blob/master/staging/maven-plugin/README.md
10. Nexus Stagaing Deployment documentation http://books.sonatype.com/nexus-book/reference/staging-deployment.html

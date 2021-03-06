# Salesforce Trigger Handler Framework

[salesforceben - by Shumon Saha.](https://www.salesforceben.com/the-salesforce-trigger-handler-framework/)

## The Tick Box
By utilizing this tick box, we can turn on/off all triggers in one click. It’s helpful because triggers are often required to be turned off during data loading.

- Setup → Platform Tools → Custom Code → Custom Metadata Types → New button
  - Label: Org-Specific Setting
  - Plural Label: Org-Specific Settings
  - Starts with vowel sound: Ticked
  - Object Name: Org_Specific_Setting
  - Save

- Next, click the "New" button on `Custom Fields` for adding the on/off tick box.
  - Field Type: Checkbox
  - Field Label: Value
  - Default Value: Checked
  - Field Name: Value
  - Save

- Next, to add your first record, click the "Manage Org-Specific Settings" button → New
  - Label: Run All Triggers
  - Org-Specific Setting Name: Run_All_Triggers
  - Value: Ticked
  - Save

## The Trigger Helper
- This is where you write your small bite-sized tasks (not related to computer bytes). Rename the functions as required.
- From within the `<your-project>` directory, run this command from the root of your project: `sfdx force:apex:class:create -n AccountTriggerHelper -d force-app/main/default/classes`
- Open `AccountTriggerHelper.cls` and replace the scaffold code with this code, then save the file.
- Now, push (synchronize) your new code to the scratch org: `sfdx force:source:push`

## The Trigger Handler Interface
- Interfaces enforce developers to follow the same blueprint. So there should be only one TriggerHandler Interface in the whole org; not one per object.
- From within the `<your-project>` directory, run this command from the root of your project: `sfdx force:apex:class:create -n TriggerHandler -d force-app/main/default/classes`
- Open `TriggerHandler.cls` and replace the scaffold code with this code, then save the file.
- Now, push (synchronize) your new code to the scratch org: `sfdx force:source:push`

## The Trigger Handler
- Here is the Trigger Handler for the Account object. Don’t forget to uncomment your required lines of code.
- From within the `<your-project>` directory, run this command from the root of your project: `sfdx force:apex:class:create -n AccountTriggerHandler -d force-app/main/default/classes`
- Open `AccountTriggerHandler.cls` and replace the scaffold code with this code, then save the file.
- Now, push (synchronize) your new code to the scratch org: `sfdx force:source:push`

## The Single Trigger Per Object
- Here is the single trigger for the Account object. Don’t forget to uncomment your required lines of code.
- From within the `<your-project>` directory, run this command from the root of your project: `sfdx force:apex:trigger:create -n AccountTrigger -s Account -e 'before insert, before update, before delete, after insert, after update, after delete, after undelete' -d ./force-app/main/default/triggers`

## Test Class
- From within the `<your-project>` directory, run this command from the root of your project: `sfdx force:apex:class:create -n AccountTriggerHelperTest -d force-app/main/default/classes`
- Open `AccountTriggerHelperTest.cls` and replace the scaffold code with this code, then save the file.
- Now, push (synchronize) your new code to the scratch org: `sfdx force:source:push`

### Metadata Magic: Pull Changes into Your Project
- In the root directory of your `<your-project>`, open the `.forceignore` file and add `**/profiles` as a new line to the file, then save the file.
- In the command window, sync the changes you made in the scratch org with your local project: `sfdx force:source:pull`

### Validate Your App
- Create a new scratch org: `sfdx force:org:create -f config/project-scratch-def.json -a <your-test-org>`
- Push your local source and metadata to the scratch org: `sfdx force:source:push -u <your-test-org>`
- Open your org: `sfdx force:org:open -u <your-test-org>`
- Run `AccountTriggerHelperTest.cls` test class

### Delete and Logout
- `sfdx force:org:delete -u <your-org-alias>`
- `sfdx auth:logout --all`

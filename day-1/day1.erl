-module(day1).
-compile(export_all).

-define(INPUT_FILE, "./input.txt").

string_to_integer_output({error, Reason}) ->
    io:format(Reason),
    0;

string_to_integer_output({Int, _}) ->
    Int.

start() ->
    {ok, Content} = file:read_file(?INPUT_FILE),

    ElfList = string:split(Content, "\n\n", all),

    ELfCaloriesListAsStrings = lists:map(
                                 fun(Elf) -> string:split(Elf, "\n", all) end,
                                 ElfList
                                ),

    ElfCaloriesList = lists:map(
                        fun(CaloriesList) ->
                                lists:map(
                                  fun(Calorie) ->
                                          string_to_integer_output(string:to_integer(Calorie))
                                  end,
                                  CaloriesList
                                 )
                        end,
                        ELfCaloriesListAsStrings
                       ),

    ElfCaloriesSummed = lists:map(
                          fun(ElfCalories) ->
                                  lists:sum(ElfCalories)
                          end,
                          ElfCaloriesList
                         ),

    % First part
    % lists:max(ElfCaloriesSummed).

    % Second part
    SortedElfCalories = lists:reverse(lists:sort(ElfCaloriesSummed)),

    TopThreeElf = lists:sublist(SortedElfCalories, 3),

    lists:sum(TopThreeElf).

